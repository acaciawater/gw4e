/**
 * @author: theo
 */

var baseMaps = {}

var storage = sessionStorage // or localStorage?

function changeBaseLayer (e) {
  storage.setItem('baselayer', e.name)
}

function restoreMap (map) {
  let succes = false
  var name = storage.getItem('baselayer')
  if (name) {
	let bm = baseMaps[name] 
    if (bm) {
    	bm.addTo(map)
        succes = true
    }
  }
  return succes
}

function saveBounds (map) {
  const b = map.getBounds()
  const key = `bounds${map.id}`
  storage.setItem(key, b.toBBoxString())
}

function restoreBounds (map) {
  const key = `bounds${map.id}`
  const b = storage.getItem(key)
  if (b) {
    const corners = b.split(',').map(Number)
    map.fitBounds([[corners[1], corners[0]], [corners[3], corners[2]]])
    return true
  }
  return false
}

var theMap = null
var overlayLayers = []
const iconVisible = 'far fa-check-square'
const iconInvisible = 'far fa-square'

function reorderOverlays (layers) {
  // show layers in proper order on map
  layers.forEach(layer => {
    if (layer.options.visible) {
      layer.bringToFront()
    }
  })
}

function sortOverlays (layers, keys) {
  // sort overlay layers by displayName using ordered array keys and display on map
  reorderOverlays(layers.sort((a, b) => {
    const indexA = keys.indexOf(a.options.displayName)
    const indexB = keys.indexOf(b.options.displayName)
    return indexA > indexB ? 1 : indexA < indexB ? -1 : 0
  }))
}

function toggleLayer (event) {
  const icon = event.target
  const legend = $(icon).next()
  const name = legend.text()
  const layer = overlayLayers.find(o => o.options.displayName === name)
  if (layer.options.visible) {
    theMap.removeLayer(layer)
    layer.options.visible = false
    icon.className = icon.className.replace(iconVisible, iconInvisible)
    legend.next('.collapse').collapse('hide')
  } else {
    theMap.addLayer(layer)
    layer.options.visible = true
    icon.className = icon.className.replace(iconInvisible, iconVisible)
    legend.next('.collapse').collapse('show')
  }
  reorderOverlays(overlayLayers)
  // inform backend about visibility change
  $.post('toggle/', JSON.stringify([name]))
}

function sanitizeOptions(layer) {
	const except = ['legend','url','downloadUrl','stylesheet']
	return Object.entries(layer).reduce((obj, item) => {
		const [key, value] = item
		if (!except.includes(key)) {
			obj[key]=value
		}
		return obj
	}, {}) 
}

async function addOverlay (map, layer) {
  if (layer) {
	const options = sanitizeOptions(layer)
    const overlay = L.tileLayer.betterWms(layer.url, options)
    overlay.on('load',function() {
    	console.debug(`Overlay loaded: ${overlay}`)
    })
    if (layer.visible) {
      overlay.addTo(map)
    }
    return overlay
  }
}

async function addOverlays (map, list, layers) {
  return Object.keys(layers).map(name => {
    const layer = layers[name]
    return addOverlay(map, layer).then(overlay => {
      const id = overlayLayers.push(overlay) - 1
      const icon = layer.visible ? iconVisible : iconInvisible
      let item = `<li id=item_${id} class="list-group-item">
        <i class="statusicon pr-2 pl-0 pt-1 ${icon} float-left" onclick="toggleLayer(event)"></i>
        <div data-toggle="collapse" href="#legend_${id}">${name}</div>`
      if (layer.downloadUrl) {
        item += `<a href="${layer.downloadUrl}"><i class="fas fa-file-download float-right" title="download"></i></a>`
      }
      item += `<div class="collapse" id="legend_${id}"><img src="${layer.legend}"></img></div></li>`
      list.append(item)
    })
  })
}


/**
 * Initializes leaflet map
 * @param div where map will be placed
 * @options initial centerpoint and zoomlevel
 * @returns the map
 */
function initMap (div, options, id) {
  var map = L.map(div, options)
  // assign id to map
  map.id = id

  const basePane = map.createPane('basePane')
  basePane.style.zIndex = 100

  var osm = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
    pane: 'basePane'
  })

  var stamen = L.tileLayer('http://tile.stamen.com/terrain/{z}/{x}/{y}.png', {
    attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://creativecommons.org/licenses/by-sa/3.0">CC BY SA</a>.',
    pane: 'basePane',
  })
  
  var roads = L.gridLayer.googleMutant({
    type: 'roadmap', // valid values are 'roadmap', 'satellite', 'terrain' and 'hybrid'
    pane: 'basePane'
  })

  var satellite = L.gridLayer.googleMutant({
    type: 'satellite', // valid values are 'roadmap', 'satellite', 'terrain' and 'hybrid',
    pane: 'basePane'
  })

  var topo = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}', {
    attribution: 'Tiles &copy; Esri',
    pane: 'basePane'
  })

  var imagery = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
    attribution: 'Tiles &copy; Esri',
    pane: 'basePane'
  })

  const baseMaps = { Openstreetmap: osm, 'Terrain': stamen, 'Google maps': roads, 'Google satellite': satellite, 'ESRI topo': topo, 'ESRI satellite': imagery }
  const overlayMaps = {}
  map.layerControl = L.control.layers(baseMaps, overlayMaps).addTo(map)

  if (!restoreMap(map)) {
    // use default map
    osm.addTo(map)
  }

  restoreBounds(map)

  L.control.scale({position:'bottomleft'}).addTo(map);
  
  map.on('baselayerchange', function (e) { changeBaseLayer(e) })
  map.on('zoomend', function () { saveBounds(map) })
  map.on('moveend', function () { saveBounds(map) })
  theMap = map
  return map
}

class WFSLayer {

  constructor (title) {
    this.features = []
    this.legends = []
    this.layer = undefined
    this.title = title
  }

  fetchJSON(url) {
	  return fetch(url).then(response => response.json())
  }
  
  loadLegend(url) {
	  return this.fetchJSON(url).then(data => {
		  this.legends = data.legends
		  return this.legends
	  })
  }

  /**
   * return list of property names
   * (uses first feature)
   */
  getProperties() {
	  return Object.keys(this.features[0].properties)
  }
  
  getLegend (property) {
	    return this.legends.find(leg => leg.property == property)
	  }

  getColor (value, property) {
    if (value !== null) {
      const legend = this.getLegend(property)
      if (legend) {
	      let entry
	      if (legend.type == 'range') {
	    	  entry = legend.entries.find(e => e.hi > value)
	      }
	      else {
	    	  entry = legend.entries.find(e => e.value == value)
	      }
	      if (entry)
	    	  return entry.color
      }
    }
    return 'gray'
  }

  getStyle(feature, property) {
    const value = feature.properties[property]
    if (value === undefined) {
      // property does not exist or is not defined
      return {
        radius: 3,
        color: 'gray',
        fillColor: 'gray',
        weight: 0,
        stroke: false,
        opacity: 0.5,
        fillOpacity: 0.5
      }
    } 
    else {
      return {
        radius: 4,
        fillColor: this.getColor(value, property),
        color: 'white',
        weight: 1,
        opacity: 1,
        fillOpacity: 0.8
      }
    }
  }

  getFeatureInfo (feature) {
	const title = this.title || 'Properties'
    let html = `<h5 class="text-center unibar">${title}</h5><table class="table table-hover table-sm"><thead><tr><th>Property</th><th>Value</th></tr></thead><tbody>`
    for (const [prop, value] of Object.entries(feature.properties)) {
    	if (value) { // skip empty rows
    		html += `<tr><td>${prop}</td><td>${value || "-"}</td></tr>`
    	}
    }
    return html + '</tbody></table>'
  }

  getLegendContent (property) {
    const legend = this.getLegend(property)
    if (legend === undefined) {
    	return ''
    }
    let html = `<strong>${legend.title}</strong>`
    legend.entries.forEach(entry => {
    	html += `<div><i class="fas fa-circle fa-xxs px-2" style="color:${entry.color}"></i>${entry.label}</div>`
    })
    html += '<div><i class="fas fa-circle fa-xxs px-2" style="color:gray"></i>no data</div>'
    return html
  }

  options(property) {
	  return {
		  filter: feature => {
			  return property? feature.properties[property]: true
		  },
		  pointToLayer: (feature, latlng) => {
			  return L.circleMarker(latlng, this.getStyle(feature, property))
		  },
	  	  onEachFeature: (feature, layer) => {
	  		  if (property) {
	  			const value = feature.properties[property]
	  			layer.bindTooltip(`${property}: ${value}`)
	  		  }
	  		  layer.bindPopup(this.getFeatureInfo(feature), { maxHeight: 600, minWidth: 400 })
	  	  }
	  }
  }
  /**
   * create a leaflet layer from a wfs getfeature response
   */
  createLayer (response) {
    this.features = response.features
    this.layer = L.geoJSON(response, this.options())
    return this.layer    
  }

  filter(property) {
	  this.layer.options = {...this.layer.options, ...this.options(property)}
	  this.layer.clearLayers()
	  this.layer.addData(this.features)
  }
}

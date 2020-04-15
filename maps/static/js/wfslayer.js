class WFSLayer {

  constructor () {
    this.features = {}
    this.legends = {}
    this.attribute = ''
    this.layer = undefined
  }

  loadLegend(url) {
    return $.getJSON(url).then(response => {
      this.legends = response
      return this.legends
    })
  }

  getColor (value) {
    if (value !== null) {
      const attr = this.getAttribute()
      const legend = this.legends[attr]
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

  getStyle(feature) {
    const value = feature.properties[this.getAttribute()]
    if (value === undefined) {
      return {
        radius: 3,
        color: 'gray',
        fillColor: 'gray',
        weight: 1,
        opacity: 0.5,
        fillOpacity: 0.3
      }
    } else {
      return {
        radius: 5,
        fillColor: this.getColor(value),
        color: 'white',
        weight: 1,
        opacity: 1,
        fillOpacity: 0.8
      }
    }
  }

  getFeatureInfo (feature) {
    let html = '<h5 class="text-center unibar">Properties</h5><table class="table table-hover table-sm"><thead><tr><th>Attribute</th><th>Value</th></tr></thead><tbody>'
    for (const [prop, value] of Object.entries(feature.properties)) {
      html += `<tr><td>${prop}</td><td>${value || "-"}</td></tr>`
    }
    return html + '</tbody></table>'
  }

  getLegendContent () {
    const attr = this.getAttribute()
    if (attr === undefined) {
      return ''
    }
    if (this.legends === undefined) {
      return ''
    }
    const legend = this.legends.find(leg => leg.property == attr)
    if (legend === undefined) {
    	return ''
    }
    let html = `<strong>${legend.title}</strong>`
    legend.levels.forEach(entry => {
    	html += `<div><i class="fas fa-circle fa-xs pr-2" style="color:${entry.color}"></i>${entry.label}</div>`
    })
    html += '<div><i class="fas fa-circle fa-xs pr-2" style="color:gray"></i>no data</div>'
    return html
  }

  getAttribute () {
    return this.attribute
  }

  /**
   * create a leaflet layer from a wfs getfeature response
   */
  createLayer (response) {
    this.features = response.features
    const attr = this.getAttribute()
    this.layer = L.geoJSON(response, {
      onEachFeature: (feature, layer) => {
        if (attr) {
          const value = feature.properties[attr] || "no data"
          layer.bindTooltip(`${attr}: ${value}`)
        }
        layer.bindPopup(this.getFeatureInfo(feature), { maxWidth: 800 })
      },
      pointToLayer: (feature, latlng) => {
        return L.circleMarker(latlng, this.getStyle(feature))
      }
    })
    return this.layer    
  }

  redraw (map) {
    if (this.layer) {
      this.layer.remove()
      this.layer = undefined
    }
    this.createLayer(this.features).addTo(map)
  }
}

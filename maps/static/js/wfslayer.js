class WFSLayer {

  constructor () {
	this.response = undefined
    this.features = []
    this.legends = []
    this.defaultProperty = ''
    this.layer = undefined
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

  getDefaultProperty () {
	    return this.defaultProperty
	  }

  setDefaultProperty (property) {
	    this.defaultProperty = property
	  }

  getDefaultLegend () {
	    return this.getLegend(this.getDefaultProperty())
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
        fillColor: this.getColor(value, property),
        color: 'white',
        weight: 1,
        opacity: 1,
        fillOpacity: 0.8
      }
    }
  }

  getFeatureInfo (feature) {
    let html = '<h5 class="text-center unibar">Properties</h5><table class="table table-hover table-sm"><thead><tr><th>Property</th><th>Value</th></tr></thead><tbody>'
    for (const [prop, value] of Object.entries(feature.properties)) {
      html += `<tr><td>${prop}</td><td>${value || "-"}</td></tr>`
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

  /**
   * create a leaflet layer from a wfs getfeature response
   */
  createLayer (response) {
	this.response = response
    this.features = response.features
    this.layer = L.geoJSON(response, {
      onEachFeature: (feature, layer) => {
    	const prop = this.getDefaultProperty()
        if (prop) {
          const value = feature.properties[prop] || "no data"
          layer.bindTooltip(`${prop}: ${value}`)
        }
        layer.bindPopup(this.getFeatureInfo(feature), { maxWidth: 800 })
      },
      pointToLayer: (feature, latlng) => {
      	const prop = this.getDefaultProperty()
      	// consider skipping points with no data
  		return L.circleMarker(latlng, this.getStyle(feature, prop))
      }
    })
    return this.layer    
  }

  updateStyle(property) {
	this.layer.setStyle(feature => {
		return this.getStyle(feature, property)
	})
	// also update the tooltips
	this.layer.eachLayer(layer => {
      const value = layer.feature.properties[property] || "no data"
      layer.bindTooltip(`${property}: ${value}`)
	})
  }
  
  redraw (map) {
    if (this.layer) {
      this.layer.remove()
      this.layer = undefined
    }
    this.createLayer(this.response).addTo(map)
  }
}

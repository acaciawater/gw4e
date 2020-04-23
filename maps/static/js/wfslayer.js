class WFSLayer {

  constructor (title) {
    this.features = []
    this.legends = []
    this.layer = L.geoJSON() // empty layer
    this.layer.wfs = this // set back pointer
    this.title = title
  }

  /**
   * load json data using Fetch API
   */
  fetchJSON(url, options) {
	  if (options) {
		  // add options to query string
		  let u = new URL(url)
		  for (let [key, value] of Object.entries(options)) {
			  u.searchParams.append(key,value)
		  }
		  url = u.toString()
	  }
	  return fetch(url).then(response => response.json())
  }
  
  /**
   * load the legends from remote url
   */
  loadLegend(url) {
	  return this.fetchJSON(url).then(response => {
		  this.legends = response.legends
		  return this.legends
	  })
  }

  /**
   * load a FeatureCollection 
   */
  loadFeatures(url, options) {
	  this.layer.fire('loading')
	  return this.fetchJSON(url,options).then(response => {
		  this.features = response.features
		  this.layer.fire('load')
		  return this.features
	  })
	  .catch(e => {
		  this.layer.fire('error', e)
	  })
  }
  
  /**
   * return list of property names
   * (uses first feature only)
   */
  getProperties() {
	  return Object.keys(this.features[0].properties)
  }
  
  /**
   * get the legend for a property
   */
  getLegend (property) {
	    return this.legends.find(leg => leg.property == property)
	  }

  /**
   * return the marker color for a property value
   */
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

  /**
   * return the style for a feature's property value
   */
  getStyle(feature, property) {
    const value = feature.properties[property]
    if (value === undefined) {
      // property does not exist or property value is empty
      return {
        radius: 2,
        fillColor: 'gray',
        stroke: false,
        fillOpacity: 0.8
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

  /**
   * return html content for feature info
   */
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

  /**
   * get the legend content for a property
   */
  getLegendContent (property) {
    const legend = this.getLegend(property)
    if (!legend) {
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
   * return L.GeoJSON options for a property
   */
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
   * returns a promise that filters features and rebuilds layers
   */
  async filter(property) {
	  this.layer.options = {...this.layer.options, ...this.options(property)}
	  this.layer.clearLayers()
	  this.layer.lastProperty = property
	  this.layer.addData(this.features)
  }
  
  /**
   * return a promise to redraw (by reloading the features)
   */
  redraw() {
	  return this.filter(this.lastProperty)
  }
}

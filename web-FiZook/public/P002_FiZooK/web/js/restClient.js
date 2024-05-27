class RestClient {

  constructor(baseUrl) {
    this.baseUrl = baseUrl;
  }
 
  buildUrl(endpoint, params = {}) {
    let url = new URL(`${this.baseUrl}${endpoint}`);
 
    // Parametri diretti nell'URL
    endpoint = endpoint.replace(/@(\w+)/g, (match, paramName) => {

      if (params[paramName] !== undefined) {
        const value = params[paramName];
        delete params[paramName];  // Remove the parameter to avoid adding it later as query parameter

        return encodeURIComponent(value);

      }
      return match;

    });
 
    // Aggiornamento URL dopo la sostituzione
    url = new URL(`${this.baseUrl}${endpoint}`);
 
    // Aggiunta dei parametri rimanenti come query string
    Object.keys(params).forEach(key =>
      url.searchParams.append(key, params[key])
    );
 
    return url;

  }
 
  async request(endpoint, options = {}) {
    const url = this.buildUrl(endpoint, options.params || {});
 
    try {
      const response = await fetch(url, {
        method: options.method || 'GET',
        headers: options.headers,
        body: options.body ? JSON.stringify(options.body) : null,
      });
 
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      return await response.json();

    } catch (error) {
      console.error("Fetch error:", error);
      throw error;
    }

  }
 
  get(endpoint, params = {}) {
    return this.request(endpoint, { params });
  }
 
  post(endpoint, data, params = {}) {
    return this.request(endpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: data,
      params,
    });

  }
 
  put(endpoint, data, params = {}) {
    return this.request(endpoint, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: data,
      params,
    });

  }
 
  delete(endpoint, params = {}) {
    return this.request(endpoint, {
      method: 'DELETE',
      params,
    });

  }

}

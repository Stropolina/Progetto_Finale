class RestClient {

    constructor(baseUrl) {
        this.baseUrl = baseUrl;
    }

    async request(endpoint, options = {}) {
        const url = new URL(`${this.baseUrl}${endpoint}`);

        if (options.params) {
            Object.keys(options.params).forEach(key =>
                url.searchParams.append(key, options.params[key])
            );
        }

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
        return this.request(endpoint, {
            params,
        });
    }

    post(endpoint, data) {
        return this.request(endpoint, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: data,
        });
    }

    put(endpoint, data) {
        return this.request(endpoint, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: data,
        });
    }

    delete(endpoint, params = {}) {
        return this.request(endpoint, {
            method: 'DELETE',
            params,
        });
    }
}

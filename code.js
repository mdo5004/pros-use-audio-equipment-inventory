// This 

var hero = "Mario";
var game = {
    hero: "Luigi",
    properties: {
        hero: "Toad",
        getHeroName: function() {
            return this.hero;
        }
    }
};

game.properties.getHeroName(); // "Toad"

var myHerosName = game.properties.getHeroName;

myHerosName // function() { return this.hero; }
myHerosName() // Mario

// RigApiService.js
export const RigApiService = {
    url: '/rigs',
    
    get() {
        return fetch(url) 
            .then(response => response.json())
            .then(data => data)
            .catch(err => this.handleError(err))
    },
    
    post(values) {
        return fetch(url, {
            method: 'POST',
            body: JSON.parse(values),
            headers: {
                'Content-Type': 'application/json',
                'credentials': 'include'
            }
        })
            .then(response => response.json())
            .then(data => data)
            .catch(err => this.handleError(err))
    },
}

document.getElementById('rigForm').addEventListener('submit', () => {
    // get values 
    RigApiService.post(values);
})
import axios from "axios";
const API_URL = "https://swapi.dev/api";
export const getPeople = async () => {
  const response = await axios.get(`${API_URL}/people`);
  console.log(" people res", response);
  return response.data.results.map((person: any) => ({
    id: person.url.split("/")[5],
    name: person.name,
    homeworldId: person.homeworld.split("/")[5],
    speciesId:
      person.species.length > 0 ? person.species[0].split("/")[5] : null,
  }));
};

export const getPlanets = async () => {
  const response = await axios.get(`${API_URL}/planets`);
  return response.data.results.map((planet: any) => ({
    id: planet.url.split("/")[5],
    name: planet.name,
    climate: planet.climate,
    terrain: planet.terrain,
    gravity: planet.gravity,
    diameter: planet.diameter,
  }));
};

export const getSpecies = async () => {
  const response = await axios.get(`${API_URL}/species`);
  return response.data.results.map((species: any) => ({
    id: species.url.split("/")[5],
    name: species.name,
    classification: species.classification,
    designation: species.designation,
    language: species.language,
  }));
};

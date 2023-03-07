const axios = require("axios");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

async function main() {
  try {
    const response = await axios.get("https://swapi.dev/api/people/");
    const people = response.data.results;

    for (let i = 0; i < people.length; i++) {
      const person = people[i];

      const homeworldResponse = await axios.get(person.homeworld);
      const homeworld = await prisma.planet.create({
        data: {
          name: homeworldResponse.data.name,
          climate: homeworldResponse.data.climate,
          terrain: homeworldResponse.data.terrain,
        },
      });

      let species = null;
      if (person.species.length > 0) {
        const speciesResponse = await axios.get(person.species);
        console.log(speciesResponse);
        species = await prisma.species.create({
          data: {
            name: speciesResponse.data.name,
          },
        });
      }

      await prisma.people.create({
        data: {
          name: person.name,
          height: person.height,
          homeworld: {
            connect: { id: homeworld.id },
          },
          species: species
            ? {
                connect: { id: species.id },
              }
            : undefined,
        },
      });
    }
  } catch (error) {
    console.error(error);
  } finally {
    await prisma.$disconnect();
  }
}

main();

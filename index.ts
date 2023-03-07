import express from "express";
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
const app = express();
const PORT = 4000;

// Endpoint to retrieve a person object with its full planet and species information
app.get("/people/:id", async (req, res) => {
  try {
    const { id } = req.params;

    const person = await prisma.people.findUnique({
      where: { id: Number(id) },
      include: { homeworld: true, species: true },
    });

    if (!person) {
      return res.status(404).json({ message: "Person not found" });
    }

    res.json(person);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
});

// Endpoint to retrieve all data by planets and species
app.get("/planets", async (req, res) => {
  try {
    const planets = await prisma.planet.findMany();

    res.json(planets);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
});
//endpoint for getting specific species.
app.get("/species/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const species = await prisma.species.findUnique({
      where: { id: Number(id) },
    });
    if (!species) {
      return res.status(404).json({ message: "species not found" });
    }
    res.json(species);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
});
//endpoint for getting all details of species with people and planets
app.get("/species", async (req, res) => {
  try {
    const species = await prisma.species.findMany({
      include: {
        people: { include: { homeworld: true, species: true } },
      },
    });

    res.json(species);
  } catch (error) {
    console.log(error);
  }
});

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});

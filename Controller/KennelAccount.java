package Controller;

import Model.AbstractAnimal;
import Model.AnimalGenius;
import Model.*;
import Storage.Storage;

import java.time.LocalDate;
import java.util.List;


public class KennelAccount {

    private Storage dbKennel;

    public KennelAccount(Storage dbKennel) {
        this.dbKennel = dbKennel;
    }

    public List<AbstractAnimal> getAnimals() {
        return dbKennel.getAllAnimals();
    }

    public boolean createAnimal(String name, LocalDate birthDay, AnimalGenius animalGenius) {
        AbstractAnimal animal = switch (animalGenius) {
            case DOG -> new Dog(name, birthDay);
            case CAT -> new Cat(name, birthDay);
            case HAMSTER -> new Hamster(name, birthDay);
            case HORSE -> new Horse(name, birthDay);
            case CAMEL -> new Camel(name, birthDay);
            case DONKEY -> new Donkey(name, birthDay);
        };

        return dbKennel.addAnimal(animal);
    }

    public int removeAnimal(AbstractAnimal animal) {
        if (animal == null) return -1;
        return  dbKennel.removeAnimal(animal);
    }
}
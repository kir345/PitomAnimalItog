package Storage;

import Model.AbstractAnimal;
import Model.AbstractPackAnimal;
import Model.AbstractPet;
import Model.*;
import Model.Skill;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class KennelStorage implements Storage{
    Map<Integer, AbstractAnimal> dbAnimals = new HashMap<>();

    public KennelStorage() {
        init();
    }

    private void init(){
        AbstractPet dog = new Dog("Шарик", LocalDate.of(2022, 10, 5));
        dog.learnSkill(new Skill("Голос"));
        dog.learnSkill(new Skill("Лежать!"));
        dbAnimals.put(dog.getId(), dog);

        AbstractPet cat = new Cat("Мурзик", LocalDate.of(2022, 7, 9));
        cat.learnSkill(new Skill("Принести тапки"));
        cat.learnSkill(new Skill("Мяу-Мяу"));
        dbAnimals.put(cat.getId(), cat);

        AbstractPet hamster = new Hamster("Буся", LocalDate.of(2020, 10, 1));
        hamster.learnSkill(new Skill("Вертеться в колесе"));
        dbAnimals.put(hamster.getId(), hamster);

        AbstractPackAnimal horse = new Horse("Байкал", LocalDate.of(2011, 3, 11));
        horse.setLoadCapacity(300);
        horse.learnSkill(new Skill("Бегом"));
        horse.learnSkill(new Skill("Шагом"));
        dbAnimals.put(horse.getId(), horse);

        AbstractPackAnimal horse2 = new Horse("Гром", LocalDate.of(2015, 8, 27));
        horse2.setLoadCapacity(400);
        horse2.learnSkill(new Skill("Шагом"));
        horse2.learnSkill(new Skill("Но, пошла!"));
        dbAnimals.put(horse2.getId(), horse2);

        AbstractPackAnimal camel = new Camel("Горб", LocalDate.of(2018, 5, 30));
        camel.setLoadCapacity(1000);
        camel.learnSkill(new Skill("Стой!"));
        camel.learnSkill(new Skill("Пошел!"));
        dbAnimals.put(camel.getId(), camel);

        AbstractPackAnimal donkey = new Donkey("Мякиш", LocalDate.of(2021, 6, 8));
        donkey.setLoadCapacity(500);
        donkey.learnSkill(new Skill("Ешь банан!"));
        dbAnimals.put(donkey.getId(), donkey);
    }
    @Override
    public List<AbstractAnimal> getAllAnimals() {
        List<AbstractAnimal> result = new ArrayList<>();
        for (AbstractAnimal animal: dbAnimals.values()) {
            result.add(animal);
        }
        return result;
    }

    @Override
    public AbstractAnimal getAnimalById(int animalId) {
        return dbAnimals.getOrDefault(animalId, null);
    }

    @Override
    public boolean addAnimal(AbstractAnimal animal) {
        if (dbAnimals.containsKey(animal.getId())) {return false;}
        dbAnimals.put(animal.getId(), animal);
        return true;
    }

    @Override
    public int removeAnimal(AbstractAnimal animal) {
        if (!dbAnimals.containsKey(animal.getId())) {
            return -1;
        }
        AbstractAnimal removed = dbAnimals.remove(animal.getId());
        return removed.getId();
    }
}

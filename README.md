# PitomAnimalItog
## Информация о проекте

**Необходимо организовать систему учета для питомника, в котором живут домашние и вьючные животные.**

1. Используя команду *cat* в терминале операционной системы Linux, создать
два файла **Домашние животные** (заполнив файл: собаки, кошки, хомяки) и **Вьючные животные** (заполнив файл: лошади, верблюды, ослы), а затем объединить их. Просмотреть содержимое созданного файла.
Переименовать файл, дав ему новое имя (*"Друзья человека"*).

![4](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/4c9095ff-6c08-4b72-9f5c-67d1cd4e967c)

2. Создать директорию, переместить файл туда.

![5(1)](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/964dc203-d53e-455a-9b75-e059cf9b9e90)

3. Подключить дополнительный репозиторий MySQL. Установить любой пакет
из этого репозитория.

![7](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/fec11ab6-e146-417b-994b-f4aad1590d8b)

![8](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/ce314086-2dad-4859-908a-4fce0506869c)

![9](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/c33d2515-1d13-47ad-8392-983fd05472fa)

![11](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/8bec9f20-a6fc-463f-9e26-141828213831)

4. Установить и удалить deb-пакет с помощью *dpkg*.

![14](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/bd5c9c0b-e455-4b66-b8b4-c67b63186f3d)

![16](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/aabfc795-55eb-4aa9-9313-b6dd8d7d613d)

5. Выложить [историю команд](HistoryComands.md) в терминале *ubuntu*.


6. Нарисовать [диаграмму](ANIMAL.drawio), в которой есть класс родительский класс, домашние
животные и вьючные животные, в составы которых в случае домашних
животных войдут классы: собаки, кошки, хомяки, а в класс вьючные животные
войдут: лошади, верблюды и ослы.

![диаграмма](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/60f2df6a-26d5-47b0-8b26-74bb75cc1569)

7. В подключенном MySQL репозитории создать базу данных **"Друзья
человека".**

CREATE DATABASE Human_friends;

![табл1](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/6bf82d27-a8de-4b7d-92aa-91fa9b574005)

8. Создать таблицы с иерархией из диаграммы в БД.
   
![табл2](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/1935dd0c-fb25-4ab6-883a-3add20cf75d5)

![табл3](https://github.com/kir345/I_PITOMNIK_ANIMAL/assets/123649165/c9bc5774-15fb-4f70-8f94-2b69852bb763)

9. Заполнить низкоуровневые таблицы именами(животных), командами
которые они выполняют и датами рождения.

10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.

11. Создать новую таблицу *"молодые животные"* в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице.

12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам.

13. Создать класс с [Инкапсуляцией методов и наследованием по диаграмме](Model).

14. Написать [программу, имитирующую работу реестра домашних животных](Main.java) 
В программе должен быть реализован следующий функционал:
* 14.1 Завести новое животное
* 14.2 определять животное в правильный класс
* 14.3 увидеть список команд, которое выполняет животное
* 14.4 обучить животное новым командам
* 14.5 Реализовать навигацию по меню

15. Создайте класс [Счетчик](Util/Counter.java), у которого есть метод add(), увеличивающий значение внутренней int переменной на 1 при нажатие "Завести новое
животное". Сделайте так, чтобы с объектом такого типа можно было работать в
блоке *try-with-resources*. Нужно бросить исключение, если работа с объектом
типа счетчик была не в ресурсном try и/или ресурс остался открыт. Значение
считать в ресурсе try, если при заведения животного заполнены все поля.

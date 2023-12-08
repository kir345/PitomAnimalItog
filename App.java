
import Controller.KennelAccount;
import Storage.KennelStorage;
import View.ConsoleView;
import View.View;

public class App {
    
    public static void run() {
        KennelAccount kennelAccounting = new KennelAccount(new KennelStorage());
        View view = new ConsoleView(kennelAccounting);

        while (true) {
            view.showKennelRegistry();
            View.MainMenuCommand code = view.showMainMenuWithResult();
            switch (code) {
                case ADD_ANIMAL -> {
                    boolean result = view.showAddAnimalDialog();
                    String resMessage = result ? "Животное добавлено" : "Не удалось добавить животное в список";
                    System.out.println(resMessage);
                }
                case SHOW_SKILLS -> {
                    view.showDetailInfoAnimalDialog();
                }
                case REMOVE_ANIMAL -> {
                    int removeId = view.showRemoveAnimalDialog();
                    String resMessage = removeId > -1  ? "Животное выписано из питомника" + removeId : "Не удалось  выписать животное из питомника";
                    System.out.println(resMessage);
                }
                case EXIT -> {
                    System.out.println("До встречи! )");
                    return;
                }
            }
        }
    }
}

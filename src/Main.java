import Controller.PetController;
import Model.Pet;
import Services.IRepository;
import Services.PetRepository;
import UserInterface.ConsoleMenu;

public class Main {
    public static void main(String[] args) throws Exception {

        IRepository <Pet> myFarm = new PetRepository();
        PetController controller = new PetController(myFarm);
        new ConsoleMenu (controller).start();
    }
} 
public class Main {
  public static void main(String[] args) {
    
    Item i1 = new Item();
    i1.Set_itemcode(1);
    i1.Set_stock(30);
    i1.Set_itemname("Ball");
    i1.Set_itemdescription("Standard Molten Basketball");

    i1.Take_Items(20);
    i1.Give_Items(50);
    i1.Display_Item();
    i1.Item_Balance();
    System.out.println("");

    Item i2 = new Item();
    i2.Set_itemcode(2);
    i2.Set_stock(10);
    i2.Set_itemname("Shirt");
    i2.Set_itemdescription("Army Style Nike T-Shirt");

    
    i2.Display_Item();
    i2.Item_Balance();
    i2.Take_Items(15);
    System.out.println("");

    i2.Give_Items(30);
    i2.Take_Items(15);
    i2.Item_Balance();
  }
}

class Item{
  int item_code, item_sold, item_delivered, stock;
  String item_name, item_description;
  
    void Set_itemcode(int a){
        item_code = a;
    }
    void Set_stock(int a){
        stock = a;
    }
    void Set_itemname(String a){
        item_name = a;
    }
    void Set_itemdescription(String a){
        item_description = a;
    }
    
    int Get_itemcode(){
        return item_code;
    }
    int Get_stock(){
        return stock;
    }
    String Get_itemname(){
        return item_name;
    }
    String Get_itemdescription(){
        return item_description;
    }
    
    void Item_Balance(){
        System.out.println("Item: " + item_name);
        System.out.println("Number of Stock: " + stock);
        System.out.println("Number of Sold: " + item_sold);
        System.out.println("Current Stock: " +(stock-item_sold));
        System.out.println("Number of Item Received from Supplier: " + item_delivered);
        System.out.println("Current Stock: " + ((stock-item_sold)+item_delivered));
    }
    void Display_Item(){
        System.out.println("\nItem: " + item_name);
        System.out.println("Item Code: " + item_code);
        System.out.println("Item Description: " + item_description);
        System.out.println("Number of stock: " + stock);
        System.out.println(" ");
    }
    
    void Take_Items(int quantity){ 
        if(stock>=quantity){ 
            stock-=quantity;
            item_sold+=quantity;
        }
        else{
            System.out.println("\nError! Insufficient item stock to satisfy order amount of " + quantity);
        }
    }
    void Give_Items(int quantity){ 
        stock+=quantity; 
        item_delivered+=quantity; 
    }
}
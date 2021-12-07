import Foundation

class Pet   {
    var ID : String = ""
    var name : String = ""
    var type : String =  ""
    var age  : Int = 0
    var petArray = [Pet]()
    
    init(ID:String,name:String,type :String,age:Int) {
        self.ID = ID
        self.type = type
        self.name = name
        self.age = age
    }
    init(){
    }
    func getID() -> String {
        return ID
    }
    func getName() -> String{
        return name
    }
    func setID(ID : String ){
        self.ID = ID
    }
    func AddPet(){
      
        print("\n Enter ID : ")
        var ID = readLine()
        print("\n Enter name :")
        var name = readLine()
        print("\n Enter type : ");
        var type = readLine()
        print("\n Enter age  :")
        var age : Int?
        age = Int(readLine()!)
        var pet = Pet(ID: ID!, name: name!, type: type!, age: age!)
        petArray.append(pet)
    }
     
    func ShowPet(){
        for i in self.petArray {
            print("\n")
            print("ID : ",i.ID)
            print("Name : ",i.name)
            print("Type : ",i.type)
            print("Age : ",i.age)
            print("\n")
        }
    }
    func searchYourPet(){
        var check = 0
        print("Select : ")
        print("1. Search By Pet Name")
        print("2. Exit ")
        var select : Int?
        select = Int(readLine()!)
        if select == 1 {
            print("Enter Pet name for Searching  : ")
            var name = readLine()
            for i in self.petArray {
                if i.name == name {
                    print("Search Results")
                    print("\n")
                    print("ID : ",i.ID)
                    print("Name : ",i.name)
                    print("Type : ",i.type)
                    print("Age : ",i.age)
                    print("\n")
                    check = 1
                }
            }
            if(check == 0){
                print(" Name Not Found ")
            }
        }
    }
    func menuUpdate(){
        print("1. Update Pet Name")
        print("2. Update Pet Age")
    }
    func  UpdatePet(){
        var check = 0
        print("\n Enter ID : ")
        var ID = readLine()
        for i in self.petArray {
            if i.ID == ID {
                print("\n")
                print("ID : ",i.ID)
                print("Name : ",i.name)
                print("Type : ",i.type)
                print("Age : ",i.age)
                print("\n")
                menuUpdate()
                var chon : Int?
                chon = Int(readLine()!)
                switch chon! {
                case 1 :print("\n Enter Pet name :")
                    var name = readLine()
                    i.name = name!
                    break
                case 2:
                    print("\n Enter Pet Age : ")
                    var age = Int(readLine()!)
                    i.age = age!
                    break
   
                default :
                    break;
                }
                check = 1
            }
        }
        if check != 0 {
            print("No Id Found")
        }
    }
    func DeletePet(){
        var check = 0
        print("Enter Pet ID  To Delete : ")
        var ID = readLine()
         var i = 0
        while  i <= self.petArray.count{
       
            if self.petArray[i].ID == ID {
                self.petArray.remove(at: i)
                check = 1
            }
            i  = i + 1
        }
       
        if(check == 0){
            print("No Id Found")
        }
    }
    
}

extension Pet : Equatable {
    static func == (lhs : Pet, rhs : Pet) ->Bool {
        return lhs.ID == rhs.ID || lhs.name == rhs.name
    }
}


func ManagerPet(){
    var pet = Pet()
    var select :Int?
    do {
        repeat{
            menu()
            print("\n Enter Number :")
            var s_select = readLine()?.trimmingCharacters(in: .whitespaces)
            select = Int(s_select!)
            switch select{
            case 1:
                pet.AddPet()
                break
            case 2:
                pet.ShowPet()
                break
            case 3:
                pet.searchYourPet()
                break
            case 4:
                pet.DeletePet()
                break
            case 5:
                pet.UpdatePet()
                
            default :
                break
            }
        }while select!  != 6
    }catch {
        
    }
}
func menu(){
    print("Choose Number and Press Enter")
    print("1. Add New Pet")
    print("2. Show All Pets")
    print("3. Search for a Pet")
    print("4. Delete a Pet")
    print("5. Update a Pet")
    print("6. Exit")
}
ManagerPet()


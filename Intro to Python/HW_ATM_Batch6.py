# ATM 
# Create class cardHoler
class cardHolder():

  def __init__(self, cardNum, pin, firstname, lastname, balance):
    self.cardNum = cardNum
    self.pin = pin
    self.firstname = firstname
    self.lastname = lastname
    self.balance = balance

### Getter methods ## return same same print()

  def get_cardNum(self):
    return self.cardNum

  def get_pin(self):
    return self.pin

  def get_firstname(self):
    return self.firstname

  def get_lastname(self):
    return self.lastname

  def get_balance(self):
    return self.balance

### Setter methods # เราใช้ set_balance ในการไปรับค่า deposit ใหม่

  def set_cardNum(self, newVal):
    self.cardNum = newVal

  def set_pin(self, newVal):
    self.cardNum = newVal

  def set_firstname(self, newVal):
    self.firstname = newVal

  def set_lastname(self, newVal):
    self.lastname = newVal

  def set_balance(self, newVal):
    self.balance = newVal


### Create print out ## same same rork paper scissors

  def print_out(self):
    print("------------------------------------------------")
    print("Account Name: ", self.cardNum)
    print("Pin: ", self.pin)
    print("First Name: ", self.firstname)
    print("Last Name: ", self.lastname)
    print("Balance", self.balance)

def print_menu():
  print("------------------------------------------------")
  print("Please choose from one the following option...")
  print("1. Deposit")
  print("2. Withdraw")
  print("3. Show Balance")
  print("4. Information")
  print("5. Change First Name")
  print("6. Change Last Name")
  print("7. Change PIN")
  print("8. Exit")

### 1. Deposit # real float it will cash
def deposit(cardHolder):  # why parameter is cardHolder ??? >> Think about when you front in ATM. The machine ask you to put Information of cardnumber and pin right? >> cardHolder is like Identification it use to identify youself ## it everthing work on within cardnumber of you hold. There refer to you.
  try:  # try > test float?
    print("------------------------------------------------")
    deposit = float(input("How mush money would you like to deposit: "))  # console
    cardHolder.set_balance(cardHolder.get_balance() + deposit)  # concect old balance(get_balance) + deposit(newVal) อารมณ์เหมือนพอใส่ค่าใหม่ปั๊ปก็จะอัพเดทค่าใหม่...โดยการนำค่าเก่า + ค่าใหม่ deposit
    print("Thank you for your money. Your new balance is: ", str(cardHolder.get_balance()))  # Why str. Maybe this code in print()
  except:
    print("Invalid input")  # this is result if input not float
      
### 2. Withdraw # real float it will cash
def withdraw(cardHolder):
  try:
    print("------------------------------------------------")
    withdraw = float(input("How mush money would you like to withdraw: "))
    if cardHolder.get_balance() < withdraw:  # check get_balance has enough
      print("------------------------------------------------")
      print("Insufficeint balance :(")
      print("Your cerrent balance is: ", cardHolder.get_balance())
    else:  # if get_balance has enough allow to withdraw and calculate balance
      cardHolder.set_balance(cardHolder.get_balance() - withdraw)  # allow to withdraw # if user withdraw the balance is reduce
      print("Your withdraw is: ", withdraw,"\nYour new balance is: ", str(cardHolder.get_balance())) 
  except:
    print("Invalid input")


### 3. Check balance
def check_balance(cardHolder):  # print out on console
  print("------------------------------------------------")
  print("Account Name: ", cardHolder.get_cardNum())
  print(f"Name : {cardHolder.get_firstname()} {cardHolder.get_lastname()}")
  print("Your cerrent balance is: ", cardHolder.get_balance())

### 4. Check Information
def check_information(cardHolder):
    cardHolder.print_out()

### 5. Change First name
def change_firstname(cardHolder) :
    print("------------------------------------------------")
    new_firstname = str(input("What your new firstname: ").capitalize())
    old_firstname = str(input("Please input your old firstname: ").capitalize())
#    current_user.set_firstname(current_user.get_firstname().append(new_firstname)) # ไม่่ใช่ append
    if old_firstname != current_user.get_firstname() :
      print("Please check spelling again ")
    else :
      current_user.firstname = new_firstname
      print("------------------------------------------------")
      print("Your First name has been changed")
      print("New First Name: ", current_user.get_firstname())
### 6. Change Last name
def change_lastname(cardHolder) :
    print("------------------------------------------------")
    new_lastname = str(input("What your new lastname: ").capitalize())
    old_lastname = str(input("Please input your old lastname: ").capitalize())
    if old_lastname != current_user.get_lastname() :
        print("Please cahek spelling again ")
    else :
        current_user.lastname = new_lastname
        print("------------------------------------------------")
        print("Your Last name has been changed")
        print("New Last Name: ", current_user.get_lastname())
### 7. Change PIN
def change_pin(cardHolder) :
    while True:
      try:
        print("------------------------------------------------")
        userPin = int(input("Please enter your old pin: ").strip())  # strip() remove space and remove leading/tailing character(specific)
        if current_user.pin == userPin:
          new_pin = int(input("Please enter new PIN: ").strip())
          current_user.pin = new_pin
          print("------------------------------------------------")
          print("Your New PIN has been changed")
          print("Your New PIN: ", current_user.get_pin())
          break
        else:
          print("Invalid PIN. Please try again")
      except:
        print("Invalid PIN. Please try again.")

### Open account
print("------------------------------------------------")
print("Welcome to open new account")
print("------------------------------------------------")
cN = str(input("Please enter card number: "))
pw = int(input("Plaese enter your pin: ").strip())
fn = str(input("Please enter your first name: ").capitalize())
ln = str(input("Please enter your last name: ").capitalize())
ba = float(input("How mush you to deposit first time for open account: "))
current_user = cardHolder(cN,pw,fn,ln,ba)

print("------------------------------------------------")
print("Welcome to ATM :)")
### Prompt user for debit card number
debitcardNum = ""
while True:
  try:
    debitcardNum = input("Please insert your debit card: ")
    ### Check againt repo
    if (current_user.get_cardNum() == debitcardNum) : # step 1 check input debitcardNum has information in database
      break  ## is allow to start process
    else:
      print("Card number not recognized. Please try again.")

  except:
    print("Card number not recognized. Please try again.")

### Prompt for pin
while True:
  try:
    userPin = int(input("Please enter your pin: ").strip())  # strip() remove space and remove leading/tailing character(specific)
    if current_user.pin == userPin:
      break
    else:
      print("Invalid PIN. Please try again")
  except:
    print("Invalid PIN. Please try again.")

### Prompt options
print("------------------------------------------------")
print("Welcome", current_user.get_firstname(), " :) ")
option = 0  ## why ?? # again while loop
while True:
  print_menu()  # if option is 0 they call def print_menu() to show option of ATM
  try:
    option = int(input())
  except:
    print("Invalid Input. Please try again.")

  if option == 1:
    deposit(current_user)  ## why cerrent_user ??
  elif option == 2:
    withdraw(current_user)
  elif option == 3:
    check_balance(current_user)
  elif option == 4:
    check_information(current_user)
  elif option == 5:
    change_firstname(current_user)
  elif option == 6:
    change_lastname(current_user)
  elif option == 7:
    change_pin(current_user)
  elif option == 8:
    break
  else:
    option = 0  # option back to zero
print("------------------------------------------------")
print("Thank you. Have a nice day :)",current_user.get_firstname())
print("------------------------------------------------")

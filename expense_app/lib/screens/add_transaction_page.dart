import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: AddTransactionPage(),
));

class AddTransactionPage extends StatefulWidget{
  const new({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  String _transactionType = "Expense";
  DateTime? selectedDate;

// DATE PICKER
  Future<void> pickDate() async{
                  final date = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2200));

                    if (date != null){
                      setState(() {
                        selectedDate = date;
                      });
                    }
                }


  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Transaction"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 172, 172, 172),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
            // DEFAULT TYPE: EXPENSE
                  DropdownMenu(
                    label: Text("Type"),
                    initialSelection: "Expense",
                    width: MediaQuery.of(context).size.width - 50,
                    onSelected: (type){
                    if (type != null){
                      setState((){
                        _transactionType = type;
                      });
                    }
                  },
// -------------TYPE: INCOME, EXPENSE, TRANSFER ----------------------------------------
            
                   dropdownMenuEntries: <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: "Expense", label: 'Expense'),
                    DropdownMenuEntry(value: "Income", label: 'Income'),
                    DropdownMenuEntry(value: "Transfer", label: 'Transfer'),
                  ]),
                  SizedBox(height: 20),
            
// EXPENSE TYPE - FORMAT ---------------------------------------------------------------
                  // ...[] means if the type is Expense, add the below widgets to the Column
                  if (_transactionType == "Expense") ...[
                    Text("Name", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.work_outline),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Amount", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Select an Account", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_card_rounded),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Category", style: TextStyle(fontSize: 16),),
                    DropdownMenu(
                        width: MediaQuery.of(context).size.width - 50,
                        menuHeight: 250,
                        dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: "Expense", label: 'Food & Dining'),
                        DropdownMenuEntry(value: "Income", label: 'Transport'),
                        DropdownMenuEntry(value: "Transfer", label: 'Bills & Utilities'),
                        DropdownMenuEntry(value: "Transfer", label: 'Housing'),
                        DropdownMenuEntry(value: "Transfer", label: 'Shopping'),
                        DropdownMenuEntry(value: "Transfer", label: 'Education'),
                        DropdownMenuEntry(value: "Transfer", label: 'Health'),
                        DropdownMenuEntry(value: "Transfer", label: 'Children'),
                        DropdownMenuEntry(value: "Transfer", label: 'Financial'),
                        DropdownMenuEntry(value: "Transfer", label: 'Pets'),
                        DropdownMenuEntry(value: "Transfer", label: 'Social'),
                        DropdownMenuEntry(value: "Transfer", label: 'Other'),
                      ]),
                    SizedBox(height: 20),
            
                    Text("Withdraw From Savings", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_card),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Date", style: TextStyle(fontSize: 16),),
                     TextField(
                      readOnly: true,
                      onTap: pickDate,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.date_range),
                        hintText: selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                      ),
                      ),
                    SizedBox(height: 20), 
                    
                    Text("Notes", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.notes),
                      ),
                    ),
                    SizedBox(height: 50), 

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                              width: 1,
                              color: Colors.black,
                            )
                          )
                        ),
                        onPressed: (){
            
                        }, 
                        child: Text("Add Transaction")),
                        ),

                        SizedBox(height: 200),
                    ]
            
// INCOME TYPE - FORMAT ---------------------------------------------------------------
                  else if (_transactionType == "Income") ...[
                    Text("Name", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.work_outline),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Amount", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Select an Account", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_card_rounded),
                      ),
                    ),
                    SizedBox(height: 20),
            
                    Text("Category", style: TextStyle(fontSize: 16),),
                    DropdownMenu(
                        width: MediaQuery.of(context).size.width - 50,
                        menuHeight: 250,
                        dropdownMenuEntries: <DropdownMenuEntry<String>>[
                        DropdownMenuEntry(value: "Expense", label: 'Salary'),
                        DropdownMenuEntry(value: "Income", label: 'Bonus'),
                        DropdownMenuEntry(value: "Transfer", label: 'Freelance'),
                        DropdownMenuEntry(value: "Transfer", label: 'Investment'),
                        DropdownMenuEntry(value: "Transfer", label: 'Other'),
                       
                      ]),
                    SizedBox(height: 20),
            
                    Text("Withdraw From Savings", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_card),
                      ),
                    ),
                    SizedBox(height: 20),
            
                     Text("Date", style: TextStyle(fontSize: 16),),
                     TextField(
                      readOnly: true,
                      onTap: pickDate,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.date_range),
                        hintText: selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}"
                      ),
                      ),
                    SizedBox(height: 20), 
            
                    Text("Notes", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.notes),
                      ),
                    ),
                    SizedBox(height: 50),
            
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                              width: 1,
                              color: Colors.black,
                            )
                          )
                        ),
                        onPressed: (){
            
                        }, 
                        child: Text("Add Transaction")),
                        ),

                        SizedBox(height: 200),
                    ]
// TRANSFER TYPE - FORMAT ---------------------------------------------------------------
                  else ...[
                    Text("From", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_card_rounded),
                      ),
                    ),
                    SizedBox(height: 20),
                    Icon(Icons.arrow_downward, size: 30,),
            
                    Text("To", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.add_card_rounded),
                      ),
                    ),
                    SizedBox(height: 20),
                                   
                    Text("Notes", style: TextStyle(fontSize: 16),),
                     TextField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.notes),
                      ),
                    ),
                    SizedBox(height: 50),
            
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side: BorderSide(
                              width: 1,
                              color: Colors.black,
                            )
                          )
                        ),
                        onPressed: (){
            
                        }, 
                        child: Text("Add Transaction")),
                        ),
                    ]
// ----------------------------------------------------------------------------              
                ],
            ),
        ),
      );
    }
}
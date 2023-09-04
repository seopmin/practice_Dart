import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "안녕하세요",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "신차오",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "니하오",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: "헬로우",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return NewExpense();
      },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
                "상단 탭바임 끝까지 계속 치면 어떻게 될까 가나다라마바사 그치 탭바는 길이가 고정되어 있으니까 이렇게 계속 치면 안되긴 하겠지?"),
            actions: [
              IconButton(
                onPressed: () {
                  _openAddExpenseOverlay();
                },
                icon: const Icon(Icons.add),
              ),
            ]),
        body: Center(
          child: Column(children: [
            Expanded(child: ExpensesList(expenses: _registeredExpenses))
          ]),
        ));
  }
}

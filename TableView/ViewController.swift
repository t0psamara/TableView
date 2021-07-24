//
//  ViewController.swift
//  TableView
//
//  Created by Nikita Petrenkov on 24.07.2021.
//

import UIKit


struct Meal {
    let title: String
    
    let description: String?
}



class TableViewController: UITableViewController {
    
    /// Список данных (блюд) для отображения
    let meals: [Meal] = [
        Meal(title: "Окрошка", description: "Первое блюдо"),
        Meal(title: "Салат", description: "Салаты"),
        Meal(title: "Борщ", description: "Первое блюдо"),
        Meal(title: "Соль", description: "Специи"),
        Meal(title: "Сахар", description: "Специи"),
        Meal(title: "Чай", description: "Напитки"),
        Meal(title: "Сок", description: "Напитки"),
        Meal(title: "Куриный шашлык", description: "Второе блюдо")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    /// Конфигурация таблицы
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Методы Datasource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Методы Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Определяем конкрентую ячейку по конкретному индексу в таблице
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Определяем по индексу какой item из списка данных надо взять для отображения в ячейке
        let currentMeal = meals[indexPath.row]
        
        // Отображаем данные выбранного itema из списка данных
        cell.textLabel?.text = currentMeal.title
        cell.detailTextLabel?.text = currentMeal.description
        
        return cell
    }
}

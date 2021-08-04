//
//  File.swift
//  
//
//  Created by Anton on 03.08.2021.
//

import Foundation

public struct FuncHelper {
    /// Функция для получения существительного в нужном склонении при использовании с числительными
    /// например: 1 стул, 2 стула, 5 стульев
    /// - Parameters:
    ///   - declensions: здесь нужно указать слово в 3 склонениях (например: ["стул", "стула", "стульев"])
    ///   - int: числительное, вместе с которым будет склоняться существительное
    /// - Returns: существительное в нужном склонении
    public static func getWordFrom(declensions: [String], int: Int) -> String {
        var result = int % 100
        if result >= 10 && result <= 20 {
            return declensions[2]
        }
        result = int % 10
        switch result {
        case 1:
            return declensions[0]
        case 2, 3, 4 :
            return declensions[1]
        default:
            return declensions[2]
        }
    }
    
    /// Функция возвращает период времени между двумя датами (количество дней, месяце или лет)
    /// - Parameters:
    ///   - startDate: Дата начала периода, считается от начала дня в текущей локации
    ///   - endDate: Дата окончания периода, считается от начала дня в текущей локации
    ///   - components: Компонент даты: день, месяц, год
    ///   - dateFormat: Стринговый формат даты, например "yyyy.MM.dd"
    /// - Returns: Количество дней/месяцев/лет
    public static func period(from startDate: String, to endDate: String, components: Set<Calendar.Component> = [.day], dateFormat: String) -> Int {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = dateFormat
        guard let startDate = formatter.date(from: startDate),
              let endDate = formatter.date(from: endDate) else { return 0 }
        if let period = Calendar.current.periodBetweenDays(startDate, endDate, with: components) {
            return period
        } else {
            return 0
        }
    }
}

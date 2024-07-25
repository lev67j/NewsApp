//
//  Date+.swift
//  NewsApp
//
//  Created by Lev Vlasov on 25.07.2024.
//

import Foundation

extension Date {
    func convertDate() -> String {
        return formatted(.dateTime.hour().minute().day().month().year())
    }
}

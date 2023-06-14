domains
    integer = integer
    string = string
    list[T] = [] ; [T | list[T]].

class pharmacy(
    integer id,
    string name,
    string address
).

class medicine(
    integer id,
    string name
).

class order(
    integer id,
    integer pharmacyId,
    integer customerId,
    integer quantity
).

class order_medicines(
    integer orderId,
    integer medicineId,
    integer quantity
).

class pharmacy_medicines(
    integer pharmacyId,
    integer medicineId,
    integer quantity
).

clauses
    pharmacy(1, "Pharmacy 1", "Address 1").
    pharmacy(2, "Pharmacy 2", "Address 2").
    pharmacy(3, "Pharmacy 3", "Address 3").
    pharmacy(4, "Pharmacy 4", "Address 4").
    pharmacy(5, "Pharmacy 5", "Address 5").
    pharmacy(6, "Pharmacy 6", "Address 6").
    pharmacy(7, "Pharmacy 7", "Address 7").
    pharmacy(8, "Pharmacy 8", "Address 8").
    pharmacy(9, "Pharmacy 9", "Address 9").
    pharmacy(10, "Pharmacy 10", "Address 10").
    pharmacy(11, "Pharmacy 11", "Address 11").
    pharmacy(12, "Pharmacy 12", "Address 12").
    pharmacy(13, "Pharmacy 13", "Address 13").
    pharmacy(14, "Pharmacy 14", "Address 14").
    pharmacy(15, "Pharmacy 15", "Address 15").

    medicine(1, "Medicine 1").
    medicine(2, "Medicine 2").
    medicine(3, "Medicine 3").
    medicine(4, "Medicine 4").
    medicine(5, "Medicine 5").
    medicine(6, "Medicine 6").
    medicine(7, "Medicine 7").
    medicine(8, "Medicine 8").
    medicine(9, "Medicine 9").
    medicine(10, "Medicine 10").
    medicine(11, "Medicine 11").
    medicine(12, "Medicine 12").
    medicine(13, "Medicine 13").
    medicine(14, "Medicine 14").
    medicine(15, "Medicine 15").

    order(1, 1, 1, 10).
    order(2, 2, 1, 5).
    order(3, 3, 2, 8).
    order(4, 4, 2, 3).
    order(5, 5, 3, 15).
    order(6, 6, 3, 12).
    order(7, 7, 4, 6).
    order(8, 8, 4, 9).
    order(9, 9, 5, 4).
    order(10, 10, 5, 7).
    order(11, 11, 6, 2).
    order(12, 12, 6, 11).
    order(13, 13, 7, 9).
    order(14, 14, 7, 6).
    order(15, 15, 8, 3).

    order_medicines(1, 1, 5).
    order_medicines(1, 2, 2).
    order_medicines(2, 3, 3).
    order_medicines(3, 4, 8).
    order_medicines(4, 5, 2).
    order_medicines(5, 1, 10).
    order_medicines(6, 2, 4).
    order_medicines(7, 3, 6).
    order_medicines(8, 4, 7).
    order_medicines(9, 5, 3).
    order_medicines(10, 1, 5).
    order_medicines(11, 2, 1).
    order_medicines(12, 3, 9).
    order_medicines(12, 4, 6).
    order_medicines(13, 5, 4).
    order_medicines(14, 1, 7).
    order_medicines(15, 2, 3).

    pharmacy_medicines(1, 1, 50).
    pharmacy_medicines(1, 2, 20).
    pharmacy_medicines(2, 3, 30).
    pharmacy_medicines(2, 4, 15).
    pharmacy_medicines(3, 5, 25).
    pharmacy_medicines(3, 6, 30).
    pharmacy_medicines(4, 7, 10).
    pharmacy_medicines(4, 8, 5).
    pharmacy_medicines(5, 9, 40).
    pharmacy_medicines(5, 10, 35).
    pharmacy_medicines(6, 11, 20).
    pharmacy_medicines(6, 12, 25).
    pharmacy_medicines(7, 13, 15).
    pharmacy_medicines(7, 14, 10).
    pharmacy_medicines(8, 15, 30).
    pharmacy_medicines(8, 1, 40).
    pharmacy_medicines(9, 2, 15).
    pharmacy_medicines(9, 3, 20).
    pharmacy_medicines(10, 4, 25).
    pharmacy_medicines(10, 5, 30).
    pharmacy_medicines(11, 6, 10).
    pharmacy_medicines(11, 7, 15).
    pharmacy_medicines(12, 8, 20).
    pharmacy_medicines(12, 9, 25).
    pharmacy_medicines(13, 10, 35).
    pharmacy_medicines(13, 11, 20).
    pharmacy_medicines(14, 12, 30).
    pharmacy_medicines(14, 13, 15).
    pharmacy_medicines(15, 14, 10).
    pharmacy_medicines(15, 15, 40).

clauses
    find_pharmacy_medicines(PharmacyId: integer, Medicines: list[medicine]) :-
        findall(medicine(MedicineId, MedicineName), (pharmacy_medicines(PharmacyId, MedicineId, _), medicine(MedicineId, MedicineName)), Medicines).

    find_order_medicines(OrderId: integer, Medicines: list[medicine]) :-
        findall(medicine(MedicineId, MedicineName), (order_medicines(OrderId, MedicineId, _), medicine(MedicineId, MedicineName)), Medicines).

    find_orders_for_customer(CustomerId: integer, Orders: list[order]) :-
        findall(order(OrderId, PharmacyId, CustomerId, Quantity), order(OrderId, PharmacyId, CustomerId, Quantity), Orders).

    calculate_total_quantity(Medicines: list[medicine], TotalQuantity: integer) :-
        maplist(arg(3), Medicines, Quantities),
        sumlist(Quantities, TotalQuantity).

    calculate_max_quantity(Medicines: list[medicine], MaxQuantity: integer) :-
        maplist(arg(3), Medicines, Quantities),
        max_list(Quantities, MaxQuantity).

    calculate_min_quantity(Medicines: list[medicine], MinQuantity: integer) :-
        maplist(arg(3), Medicines, Quantities),
        min_list(Quantities, MinQuantity).

    calculate_avg_quantity(Medicines: list[medicine], AvgQuantity: integer) :-
        maplist(arg(3), Medicines, Quantities),
        sumlist(Quantities, TotalQuantity),
        length(Medicines, Count),
        AvgQuantity is TotalQuantity // Count.

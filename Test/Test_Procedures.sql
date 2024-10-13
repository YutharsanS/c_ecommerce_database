-- Add product to a new cart
CALL Procedure_Add_To_Cart(2, 1 , 1);

--Add an item to an existing cart:
CALL Procedure_Add_To_Cart(3, 1, 2);

-- Increase quantity of an existing item in the cart
CALL Procedure_Add_To_Cart(1, 1, 3);

-- Add an item with insufficient stock
CALL Procedure_Add_To_Cart(3, 2, 1000);

-- Add an item with a non-existent variant ID
CALL Procedure_Add_To_Cart(3, 99999, 1);

-- Add an item with a non-existent customer ID
CALL Procedure_Add_To_Cart(99999, 103, 1);

-- Add an item with negative quantity --fails
CALL Procedure_Add_To_Cart(1, 5, -2);

-- Add multiple items in sequence
CALL Procedure_Add_To_Cart(3, 1, 1);
CALL Procedure_Add_To_Cart(3, 2, 2);
CALL Procedure_Add_To_Cart(3, 3, 3);

-- Add the same item multiple times
CALL Procedure_Add_To_Cart(1, 5, 1);
CALL Procedure_Add_To_Cart(1, 5, 2);
CALL Procedure_Add_To_Cart(1, 5, 3);

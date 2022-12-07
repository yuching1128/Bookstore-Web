// Contains all the custom types we want to use for our application
export interface BookItem {
  bookId: number;
  title: string;
  author: string;
  price: number;
  isPublic: boolean;
  isFeatured: boolean;
  categoryId: number;
  rating: number;
}

export interface CategoryItem {
  categoryId: number;
  name: string;
}

export interface CustomerForm {
  name: string;
  address: string;
  phone: string;
  email: string;
  ccNumber: string;
  // ccExpiryMonth: number;
  // ccExpiryYear: number;
  ccExpDate: number;
}

export interface Order {
  orderId: number;
  amount: number;
  dateCreated: number;
  confirmationNumber: number;
  customerId: number;
}

export interface LineItem {
  productId: number;
  orderId: number;
  quantity: number;
}

export interface OrderDetails {
  order: Order;
  customer: CustomerForm;
  books: BookItem[];
  lineItems: LineItem[];
}

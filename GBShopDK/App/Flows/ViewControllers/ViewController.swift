//
//  ViewController.swift
//  GBShopDK
//
//  Created by Denis Kazarin on 30.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  authLogin(login: "Dumba", password: "1234")
        //  authLogout(login: "Dumba", password: "1234")
        //  getProductList(pageNumber: 1, categoryId: 1)
        //  getProduct(productId: 123)
        //  userRegistration(userId: 123, userLogin: "Dumba", userPassword: "1234", userName: "Donald", userLastname: "Trump", userEmail: "some@some.ru", userCreditCard: "4276380000000000", userBio: "The president of the USA")
        //  userDataChanges(userId: 123, userLogin: "Dumba", userPassword: "1234", userName: "Donald", userLastname: "Trump", userEmail: "some@some.ru", userCreditCard: "4276380000000000", userBio: "The president of the USA")
        //  getProductReviewsList(productId: 123)
        //  addProductReview(productId: 123, userName: "Kevin", productRating: 5, userReview: "Very good")
        //  cancelProductReview(productId: 123, userName: "Kevin", reviewId: 76857)
        //  addProductToCart(productId: 234, productQuantity: 12)
        //  deleteProductFromCart(productId: 564, productQuantity: 3)
        //  getCartProductsList(userId: 234)
        //  payCartProducts(userId: 453, userCreditCard: 4276380000000000)
        
    }
    
    
    
    func authLogin(login: String, password: String) {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userLogin: login, userPassword: password) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func authLogout(login: String, password: String) {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.logout(userLogin: login, userPassword: password) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func userRegistration(userId: Int, userLogin: String, userPassword: String, userName: String, userLastname: String, userEmail: String, userCreditCard: String, userBio: String) {
        let registration = requestFactory.makeRegistrationAndDataChangesFactory()
        registration.registration(userId: userId, userLogin: userLogin, userPassword: userPassword, userName: userName, userLastname: userLastname, userEmail: userEmail, userCreditCard: userCreditCard, userBio: userBio) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func userDataChanges(userId: Int, userLogin: String, userPassword: String, userName: String, userLastname: String, userEmail: String, userCreditCard: String, userBio: String) {
        let userChanges = requestFactory.makeRegistrationAndDataChangesFactory()
        userChanges.dataChange(userId: userId, userLogin: userLogin, userPassword: userPassword, userName: userName, userLastname: userLastname, userEmail: userEmail, userCreditCard: userCreditCard, userBio: userBio) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProductList(pageNumber: Int, categoryId: Int) {
        let getProducts = requestFactory.makeProductsFactory()
        getProducts.productList(pageNumber: pageNumber, categoryId: categoryId) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProduct(productId: Int) {
        let getProducts = requestFactory.makeProductsFactory()
        getProducts.product(productId: productId) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getProductReviewsList(productId: Int) {
        let getReviewsList = requestFactory.makeProductsReviewsFactory()
        getReviewsList.productReviewsList(productId: productId) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addProductReview(productId: Int, userName: String, productRating: Int, userReview: String) {
        let addReview = requestFactory.makeProductsReviewsFactory()
        addReview.productReviewAdd(productId: productId, userName: userName, productRating: productRating, userReview: userReview) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func cancelProductReview(productId: Int, userName: String, reviewId: Int) {
        let cancelReview = requestFactory.makeProductsReviewsFactory()
        cancelReview.productReviewCancel(productId: productId, userName: userName, reviewId: reviewId) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addProductToCart(productId: Int, productQuantity: Int) {
        let addProduct = requestFactory.makeCartRequestsFactory()
        addProduct.addProductToCart(productId: productId, productQuantity: productQuantity) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteProductFromCart(productId: Int, productQuantity: Int) {
        let deleteProduct = requestFactory.makeCartRequestsFactory()
        deleteProduct.deleteProductToCart(productId: productId, productQuantity: productQuantity) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCartProductsList(userId: Int) {
        let getCartProducts = requestFactory.makeCartRequestsFactory()
        getCartProducts.getCartProductsList(userId: userId) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func payCartProducts(userId: Int, userCreditCard: Int) {
        let payCart = requestFactory.makeCartRequestsFactory()
        payCart.payCartProducts(userId: userId, userCreditCard: userCreditCard) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


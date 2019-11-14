import UIKit
import PlaygroundSupport

class Phone {
    private var phoneAnswerHandler: (() -> Void)?  // strong reference

	init() {
		print("\(self) init")
	}
	
    deinit {
        print("\(self) is deinitializing")
    }

    func call() {
        self.phoneAnswerHandler?()
    }

    func whenPhoneRings(answer: @escaping (() -> Void)) {
        phoneAnswerHandler = answer
    }
}

class Person {
    let name: String
    var phone: Phone

    init(name: String) {
        print("Person.init: \(name)")
		self.name = name
        self.phone = Phone()
		
        setupPhone()
    }

    deinit {
        print("\(self) is deinitializing")
    }

    func setupPhone() {
		
		// Two solutions
		// [weak self] = self is an optional
		// [unowned self] = self is an implictly unwrapped optional
		
        self.phone.whenPhoneRings { //[weak self] in // Memory leak! retain cycle
            print("<Answering phone>")
            print("Hello this is \(self.name)")
        }
    }
}

do {
	var person: Person? = Person(name: "Steve")
	//let phone = Phone()
	//person?.phone = phone

	person?.phone.call()
	person = nil
}

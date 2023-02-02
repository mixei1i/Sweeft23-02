import UIKit

/*
 1. გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.


     func minSplit(amount: Int) -> Int {
         // Your code goes here
     }

     Examples:
     minSplit(9) ➞ 5  //(1, 1, 1, 1, 5)
     minSplit(26) ➞ 3  //(1, 5, 20)
     minSplit(172) ➞ 6  //(1, 1, 20, 50, 50, 50)
 */

func minSplit(_ amount: Int) -> Int {
    let numb = amount
              var temp = 0
    let a = numb / 50
              temp = numb % 50
    let b = temp / 20
              temp = temp % 20
    let c = temp / 10
              temp = temp % 10
    let d = temp / 5
              temp = temp % 5
    let e = temp / 1
              return a + b + c + d + e
}

minSplit(9)     // ➞ 5  //(1, 1, 1, 1, 5)
minSplit(26)    // ➞ 3  //(1, 5, 20)
minSplit(172)   // ➞ 6  //(1, 1, 20, 50, 50, 50)


/*
 2. დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
    მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
    // 19, 20, 21, 22
    // (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19

    func sumOfDigits(start: Int, end: Int) -> Int {
        // Your code goes here
    }

    sumOfDigits(7, 8) ➞ 15
    sumOfDigits(17, 20) ➞ 29
    sumOfDigits(10, 12) ➞ 6
 */


func sumOfDigits(_ start: Int, _ end: Int) -> Int {

var counter = 0

for i in start...end {
    var temp = i
    while temp >= 1 {
        counter += (temp % 10)
        temp /= 10
    }
}
    return counter
}


   sumOfDigits(7, 8)     // ➞ 15
   sumOfDigits(17, 20)   // ➞ 29
   sumOfDigits(10, 12)   // ➞ 6





/*
 3. მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

     func isProperly(sequence: String) -> Bool {
         // Your code goes here
     }

     Examples:
     isProperly(sequence: "(()())") ➞ true
     isProperly(sequence: ")(()") ➞ false
     isProperly(sequence: "(()())(") ➞ false
 */


func isProperly(_ sequence: String) -> Bool {
    var corect = 0
    for bracket in sequence {
        if bracket == "(" {
            corect += 1
        } else if bracket == ")" {
            if (corect == 0) {
                return false
            } else {
                corect -= 1
            }
        }
    }
    let result = (corect == 0)
    return result
}

isProperly("(()())")    // ➞ true
isProperly(")(()")      // ➞ false
isProperly("(()())(")   // ➞ false


/*
 4. გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა)
    ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)


    func countWays(n: Int, steps: [Int]) -> Int {
            // Your code goes here
    }

    Examples:
    countWays(n: 3, steps: [0, 1, 0]) ➞ 1
    countWays(n: 4, steps: [0, 1, 1, 0]) ➞ 0
    countWays(n: 5, steps: [1, 1, 0, 1, 1]) ➞ 4 // (s, 1, 2, 4, 5, f), (s, 1, 2, 4, f), (s, 2, 4, 5, f), (s, 2, 4, f)  s - ხიდის ერთი მხარე, f - ხიდის მეორე მხარე
 */




func countWays(n: Int, steps: [Int]) -> Int {
    var combination = 0.0
    if steps.count == n {
        
    let array = steps
    var arrayMultiplication = [Double]()
        combination = 1.0
    
    if array.count < 1 {
        return 0
    } else if array.count == 1 {
        return 1
    }
    
    for i in 0..<n - 1 {
        if array[i] == 0 && array[i + 1] == 0 {           // comb (0, 0)
            return 0
//        } else if array[i] != array[i + 1] {              // comb (0, 1) & (1, 0)
//            arrayMultiplication.append(1)
        }  else if array[i] == 1 && array[i + 1] == 1 {   // comb (1, 1)
            if i >= 1 && i < n - 2 {
                if array[i - 1] == 0 && array[i + 2] == 0 {
                    arrayMultiplication.append(0.5)
                }
            }
            arrayMultiplication.append(2)
          }
        }
    for i in arrayMultiplication {
        combination *= i
      }

    } else {print("ERROR INPUT -> n and array.count is not equal")}
    return Int(combination)
 }

// თუ მოცელული პასუხებიდან მეორე (countWays(n: 4, steps: [0, 1, 1, 0]) ➞ 0) - არის მცდარი მაგ შემთხვევებისთვის მუშაობს ეს ალგორითმი. მოცემული გზისთვის (steps: [0, 1, 1, 0]) არსებოს გადასვლის ერთი კომბინაცია (s, 2, 3, f) აქ კი წერია 0. წინააღმდეგ შემთხვევაში ამოცანა და პასუხი ერთმანეთს არ ემთხვევა.

  countWays(n: 3, steps: [0, 1, 0])        //➞ 1
  countWays(n: 4, steps: [0, 1, 1, 0])     //➞ 0
  countWays(n: 5, steps: [1, 1, 0, 1, 1])  //➞ 4





/*
 5. გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი)
      შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან.

      func zeros(N: Int) -> Int {
          // Your code goes here
      }

      example:
      zeros(N: 7) ➞ 1
      zeros(N: 12) ➞ 2
      zeros(N: 490) ➞ 120
 */



func zeros(N: Int) -> Int {

let number = N
var count = 0

for i in 1...number {
    var x = i
    while x % 5 == 0 {
        count += 1
        x /= 5
    }
}
    return count
}

zeros(N: 7)    // ➞ 1
zeros(N: 12)   //➞ 2
zeros(N: 490)  // ➞ 120

zeros(N: 1000)

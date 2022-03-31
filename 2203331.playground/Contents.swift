enum HeightError : Error {
    case maxHeight
    case minHeight
}

func resultTypeCheckingHeight(height: Int) -> Result<Bool, HeightError> {

    if height > 190 {
            return Result.failure(HeightError.maxHeight)
    } else if height < 130 {
            return Result.failure(HeightError.minHeight)
    } else {
            if height >= 160 {
                    return Result.success(true)
            } else {
                    return Result.success(false)
            }
    }
}

let result = resultTypeCheckingHeight(height: 200)

switch result {
case .success(let data):
        print("결과값은 \(data)입니다.")
case .failure(let error):
        print(error)
}

/*
 Result Type은 애플에서 미리 제네릭 문법을 이용해서 구현한 열거형 에러처리 타입이다. 형식은 enum Result<Success, Failure> 가 안에 연관값으로 들어가 있는 형태이다. 일반적인 에러처리 타입과의 차이를 구별하면,먼저 throws 키워드와 do-catch 블록을 사용하지 않고 에러를 처리할 수 있다는 점이 있다.
 함수를 선언할 때 파라미터로 여러 개를 사용하지 않아도 된다는 점이 있다. 이 점으로 함수 선언 시에 에러에 대한 분기처리가 가능하다.
 Result Type의 에러처리 3단계
 1.에러타입을 열거형으로 먼저 선언
 2.함수 정의(throws 키워드 필요 없음)
 3.결과 처리 (성공과 실패/에러에 대한 분기처리) -> Result가 enum 타입이기 때문에 switch 문을 사용해서 처리한다.
 */

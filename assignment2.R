makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
  
cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}


aVector <- makeCacheMatrix(matrix(1:4,2,2))
aVector$get()               # retrieve the value of x
aVector$getsolve()           # retrieve the value of m, which should be NULL
aVector$set(30:50)          # reset value with a new vector
cacheSolve(aVector)          # notice mean calculated is mean of 30:50, not 1:10
aVector$getsolve()           # retrieve it directly, now that it has been cached

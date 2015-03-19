## makeCacheMatrix function creates a matrix for caching and initialises
## the variables

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL      ## intitialise 'm'variable, the result of invertion
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve(x)
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve function inverses the matxix given as input 'x' if
## if it has not inversed before, otherwise the function returns previously
## calculated result from the cache
## assumption: input matrix is a square invertible matrix

cacheSolve <- function(x, ...) {
        ## check if the inverse has been calculated before
  m <- x$getinverse() ## load the cashed result to 'm'
  if(!is.null(m)) {
    message("getting cached data")
    return(m)     ## return the cashed result if available
  }
  data <- x$get() ## load the matrix to be inverted to 'data'
  m <- solve(X)   ## calculate the inverse of 'x'
  x$setinverse(m) ## store the result to 'm'
  m
}


## Put comments here that give an overall description of what your
## functions do

## MakeCacheMatrix function a Matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

        invert <- NULL
        
        SetMatrix <- function(y) {
                x <<- y
                invert <<- NULL
        }
        
        GetMatrix <- function() x
        
        SetInvertMatrix <- function(inverse) invert <<- inverse
        
         #get Inverse of a Matrix
        GetInvertMatrix <- function() invert
        
        list(set=SetMatrix, get=GetMatrix, setinv=SetInvertMatrix, getinv=GetInvertMatrix)
}


## CacheSolve function computes inverse of a Matrix created above. It Inverse is already 
## calculated then it will retrieve from cache

cacheSolve <- function(x, ...) {
        
        invert <- x$getinv()
        
        # if  inverse exists
        if (!is.null(invert)){
                
                return(invert)
        }
        
        # else  calculate the inverse of a matrix 
        get.data <- x$get()
        invert <- solve(get.data, ...)
        
        # set the value of the inverse in the cache
        x$setinv(invert)
        
        return(invert)
}

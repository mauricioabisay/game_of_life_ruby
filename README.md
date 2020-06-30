# Game of Life

Game of Life implementation in Ruby

## Setup

### Requisites

- Git, recommended to get the source code or you can download it as a .zip file
- Docker and Docker Compose, you can get them following the instructions available in https://www.docker.com/

### Steps

1. Clone this repository
2. Run the docker app container by executing
```bash
docker-compose run app
```

#### Extra parameters

You may alter the default execution by providing the following parameters

+ **-r** indicate with an integer the rows for the grid
+ **-c** indicate with an integer the columns for the grid
+ **[i,j]** indicate with an integer pair separted by a comma the starting alive cells for the grid, starting from 0

Example

```bash
docker-compose run app ruby ./main/main.rb -r6 -c6 [0,0] [0,1] [1,0] [4,4] [4,5] [5,5]
```

## Contact

mauricioabisay.lopez@gmail.com
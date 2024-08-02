```mermaid
classDiagram
    Store <|-- User
    User <|-- Admin
    User <|-- Client
    User <|-- Post
    User <|-- Chart
    Store{
        -String name
        -Array users
        -Object contact
    }
    User{
        -String usuario
        -String correo
        -String password
        -Array posts
    }
    Admin{
        +changeStatus()
        +changePass()
    }
    Client{
        +changeStatus()
        +upgrade()
    }
    Post{
        -Collection Product
        -Array comments
    }
    Product{
        -String name
        -Array categories
        -Long price
        -Object description
    }
    Chart{
        -publicaciones
    }
```
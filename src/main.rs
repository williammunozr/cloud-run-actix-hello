use actix_web::{get, web, App, HttpServer, Responder};

#[get("/")]
async fn index() -> impl Responder {
    "Hallo, Welt!"
}

#[get("/{name}")]
async fn hello(name: web::Path<String>) -> impl Responder {
    format!("Hallo {}!", &name)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let port= match std::env::var("PORT") {
        Ok(port) => port,
        _ => String::from("8080")
    };

    let address = format!("0.0.0.0:{}", port);

    HttpServer::new(|| App::new().service(index).service(hello))
        .bind(address.clone())?
        .run()
        .await
}

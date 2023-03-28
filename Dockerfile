FROM rust

COPY . /app

WORKDIR /app

# build the app
RUN cargo build --release

# start the application
CMD ["./target/release/cloud-run-actix-hello"]
# Generate recipe file for dependencies
FROM rust as planner
WORKDIR /app
RUN cargo install cargo-chef
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

# Build Dependencies
FROM rust as cacher
WORKDIR /app
RUN cargo install cargo-chef
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

# Builder Image
FROM rust as builder
COPY . /app
WORKDIR /app
COPY --from=cacher /app/target target
COPY --from=cacher /usr/local/cargo /usr/local/cargo
RUN cargo build --release

# Running Image
FROM gcr.io/distroless/cc-debian11
COPY --from=builder /app/target/release/cloud-run-actix-hello /app/cloud-run-actix-hello
WORKDIR /app
CMD ["./cloud-run-actix-hello"]
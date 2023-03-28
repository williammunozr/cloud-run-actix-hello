# Builder Image
FROM rust as builder

COPY . /app

WORKDIR /app

# build the app
RUN cargo build --release

# Running Image
FROM gcr.io/distroless/cc-debian11

# copy the app from builder
COPY --from=builder /app/target/release/cloud-run-actix-hello /app/cloud-run-actix-hello
WORKDIR /app

# start the application
CMD ["./cloud-run-actix-hello"]
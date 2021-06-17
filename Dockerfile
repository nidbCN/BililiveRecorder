FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine
COPY . /src
RUN cd /src/BililiveRecorder.Cli && dotnet build -o /output -c Release

FROM mcr.microsoft.com/dotnet/runtime:5.0-alpine
COPY --from=0 /output /app
VOLUME [ "/rec" ]
WORKDIR /app
ENTRYPOINT [ "/app/BililiveRecorder.Cli" ]
CMD [ "-h" ]

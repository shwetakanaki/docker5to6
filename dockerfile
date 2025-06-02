FROM openjdk
WORKDIR /app
COPY . /app/ 
RUN java Main.java
CMD ["java", "Main.java"]

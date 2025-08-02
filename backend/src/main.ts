// // backend/src/main.ts
// import { NestFactory } from '@nestjs/core';
// import { AppModule } from './app.module';
// import { ValidationPipe } from '@nestjs/common';
// import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

// async function bootstrap() {
//   const app = await NestFactory.create(AppModule,{cors: true});

//   // Validation
//   app.useGlobalPipes(new ValidationPipe({ whitelist: true }));

//   // Swagger setup
//   const config = new DocumentBuilder()
//     .setTitle('Medication Tracker API')
//     .setDescription('API documentation for the Medication Tracker App')
//     .setVersion('1.0')
//     .build();

//   const document = SwaggerModule.createDocument(app, config);
//   SwaggerModule.setup('api/docs', app, document); // Swagger UI at /api

//   // Start server
//   await app.listen(4000);
//   console.log('Backend running on http://localhost:4000');
//   console.log('Swagger docs available at http://localhost:4000/api/docs');
// }
// bootstrap();



import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // ✅ Enable CORS properly
  app.enableCors({
    origin: 'http://localhost:3000',  // your frontend origin
    credentials: true,                // allow cookies/auth headers
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization'],
  });

  // Validation
 async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(new ValidationPipe({ whitelist: true, forbidNonWhitelisted: true }));
  await app.listen(4000);
}

  // Swagger setup
  const config = new DocumentBuilder()
    .setTitle('Database Integration API')
    .setDescription('API documentation for the Login')
    .setVersion('1.0')
    .build();

  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api/docs', app, document);

  await app.listen(4000);
  console.log('Backend running on http://localhost:4000');
  console.log('Swagger docs at http://localhost:4000/api/docs');
}
bootstrap();

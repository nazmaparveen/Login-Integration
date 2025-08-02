// backend/src/app.module.ts
import { Module } from '@nestjs/common';
import { PrismaModule } from './prisma/prisma.module';

import { AuthModule } from './modules/auth/auth.module';
import { UsersModule } from './modules/users/users.module';
// import { PrismaModule } from './prisma/prisma.module';
// import { PatientModule } from './patient/patient.module';
// import { MedicationModule } from './medication/medication.module';
// import { AssignmentModule } from './assignment/assignment.module';

@Module({
  imports: [PrismaModule,AuthModule, UsersModule],
})
export class AppModule {}

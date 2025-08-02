// auth/auth.service.ts
import { BadRequestException, Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcrypt';
import { UsersService } from '../users/users.service';
import { RegisterDto } from './dto/register.dto';
import { LoginDto } from './dto/login.dto';

import { PrismaService } from 'src/prisma/prisma.service'; 
import { CreateUserDto } from '../users/dto/create-user.dto';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwtService: JwtService,
  ) {}

async login(dto: LoginDto) {
  const user = await this.prisma.user.findUnique({ 
    where: { email: dto.email } 
  });

  if (!user) {
    throw new UnauthorizedException('Invalid email or password');
  }

  const isPasswordValid = await bcrypt.compare(dto.password, user.password);
  if (!isPasswordValid) {
    throw new UnauthorizedException('Invalid email or password');
  }

  const payload = { sub: user.id, email: user.email, username: user.username };
  
  return {
    access_token: await this.jwtService.signAsync(payload),
    user: {
      id: user.id,
      email: user.email,
      username: user.username
    }
  };
}

async register(dto: CreateUserDto) {
  // Check for existing email
  const emailExists = await this.prisma.user.findUnique({
    where: { email: dto.email }
  });

  if (emailExists) {
    throw new BadRequestException('Email already registered');
  }

  // Check for existing username
  const usernameExists = await this.prisma.user.findUnique({
    where: { username: dto.username }
  });

  if (usernameExists) {
    throw new BadRequestException('Username already taken');
  }

  const hashedPassword = await bcrypt.hash(dto.password, 10);

  const user = await this.prisma.user.create({
    data: {
      username: dto.username,
      email: dto.email,
      password: hashedPassword,
    },
  });

  return { message: "Registration successful", user };
}
}

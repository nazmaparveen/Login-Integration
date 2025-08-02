// auth/auth.controller.ts
import { Controller, Post, Body, InternalServerErrorException, BadRequestException, UnauthorizedException } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import { LoginDto } from './dto/login.dto';
import { ApiTags } from '@nestjs/swagger';
import { CreateUserDto } from '../users/dto/create-user.dto';

@ApiTags('Auth')
@Controller('api')
export class AuthController {
  constructor(private authService: AuthService) {}

@Post('register')
async register(@Body() createUserDto: CreateUserDto) {
  try {
    return await this.authService.register(createUserDto);
  } catch (error) {
    console.error('Registration error:', error);
    if (error?.response?.message) {
      // Forward the specific error message from the service
      throw error;
    }
    if (error?.code === 'P2002') {
      // Prisma unique constraint violation
      throw new BadRequestException('Email already registered');
    }
    throw new InternalServerErrorException('Registration failed');
  }
}

  @Post('login')
  async login(@Body() dto: LoginDto) {
    try {
      return await this.authService.login(dto);
    } catch (error) {
      console.error('Login error:', error);
      if (error?.response?.message) {
        // Forward the specific error message from the service
        throw error;
      }
      throw new UnauthorizedException('Invalid credentials');
    }
  }
}
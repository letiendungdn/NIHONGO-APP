import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { Role } from '@prisma/client';

export interface AuthUserPayload {
  id: number;
  email: string;
  role: Role;
  name: string | null;
}

export const CurrentUser = createParamDecorator(
  (_data: unknown, ctx: ExecutionContext): AuthUserPayload => {
    const request = ctx.switchToHttp().getRequest();
    return request.user;
  },
);

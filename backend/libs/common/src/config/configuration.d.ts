declare const _default: () => {
    port: number;
    database: {
        url: string | undefined;
    };
    redis: {
        url: string;
    };
    nats: {
        url: string;
    };
    cors: {
        origins: string[];
    };
    jwt: {
        secret: string;
        expiresIn: string;
    };
};
export default _default;

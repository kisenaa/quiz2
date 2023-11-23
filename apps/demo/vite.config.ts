/* eslint-disable unused-imports/no-unused-imports */
import eslintPlugin from '@nabla/vite-plugin-eslint';
import react from '@vitejs/plugin-react-swc';
import path from 'path';
import { defineConfig } from 'vite';
import { nodePolyfills } from 'vite-plugin-node-polyfills';
import { VitePWA } from 'vite-plugin-pwa'

export default defineConfig((configEnv) => {
  const isDevelopment = configEnv.mode === 'development';

  return {
    base:'/demo/build',
    plugins: [
      react(),
      eslintPlugin(),
      nodePolyfills({
        include: ['buffer', 'crypto', 'util', 'stream'],
      }),
    ],
    resolve: {
      alias: {
        '@': path.resolve(__dirname, './src'),
      },
    },
    css: {
      modules: {
        generateScopedName: isDevelopment
          ? '[name]__[local]__[hash:base64:5]'
          : '[hash:base64:5]',
      },
    },
    build: {
      manifest: true,
      emptyOutDir: true,
      outDir: path.resolve(__dirname, 'build'),
      sourcemap: true
    },
    define: {},
  };
});

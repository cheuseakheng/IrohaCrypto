#include "sr25519.h"
#include <string.h>

void sr25519_from_ed25519_bytes(uint8_t *secret_out, const uint8_t *secret_ptr) {
    if (!secret_out || !secret_ptr) return;

    // Mock logic: just copy the input to output
    memcpy(secret_out, secret_ptr, SR25519_SECRET_SIZE);
}

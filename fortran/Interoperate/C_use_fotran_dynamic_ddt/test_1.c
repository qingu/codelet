/** @file test.c
 * C side code
 */
#define FC_GLOBAL_(name, NAME) name##_
#define OPAQUE_ALLOC FC_GLOBAL_(c_opaque_alloc, C_OPAQUE_ALLOC)
#define OPAQUE_FREE FC_GLOBAL_(c_opaque_free, C_OPAQUE_FREE)
#define OPAQUE_STORAGE_SIZE 64

void OPAQUE_ALLOC(char *c_obj, int *n);
void OPAQUE_FREE(char *c_obj);

int main(int nargs, char *args[]) {
  char c_obj[OPAQUE_STORAGE_SIZE];
  int n = 100;
  OPAQUE_ALLOC(c_obj, &n);
  OPAQUE_FREE(c_obj);
  return 0;
}

#define FC_GLOBAL_(name, NAME) name##_ 
#define OPAQUE_ALLOC FC_GLOBAL_(c_opaque_alloc, C_OPAQUE_ALLOC) 
#define OPAQUE_FREE FC_GLOBAL_(c_opaque_free, C_OPAQUE_FREE) 
#define OPAQUE_SIZE FC_GLOBAL_(c_storage_size, C_STORAGE_SIZE) 

void OPAQUE_ALLOC(char *c_obj, int *n);
void OPAQUE_FREE(char *c_obj);
void OPAQUE_SIZE(int *size);

int main(int nargs, char *args[]) {
    char *c_obj;
    int my_size;
    OPAQUE_SIZE(&my_size);
    c_obj = (char *)malloc(my_size);
    int n = 100;
    OPAQUE_ALLOC(c_obj, &n);
    OPAQUE_FREE(c_obj);
    free(c_obj);
    return 0;
}

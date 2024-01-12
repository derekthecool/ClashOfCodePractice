void print_water_steps() {
    int n;
        scanf("%d", &n);
        char water[2];
        scanf("%s", water);

        for (int i = 0; i < n; i++)
        {
            printf("%.*s%s\n", i, "                                                                                ",
                   water);
        }
}

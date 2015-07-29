from django.contrib.admin import SimpleListFilter


class GaListFilter(SimpleListFilter):

    title = 'Gest Age'
    parameter_name = 'ga'

    def lookups(self, request, model_admin):
        return (
            ('completed', 'completed'),
            ('missing', 'missing'),
        )

    def queryset(self, request, queryset):
        if self.value() == 'completed':
            return queryset.filter(ga__isnull=False)
        if self.value() == 'missing':
            return queryset.filter(ga__isnull=True)

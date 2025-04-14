using WebsiteDocker.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace WebsiteDocker.Data.Config
{
    public class ProductConfiguration : IEntityTypeConfiguration<Products>
    {
        public void Configure(EntityTypeBuilder<Products> builder)
        {
            builder.HasKey(p => p.Id);

            builder.Property(p => p.Name)
                .IsRequired()
                .HasMaxLength(255);


            builder.Property(p => p.Price)
                .IsRequired();


            builder.HasData(
                new Products()
                {
                    Id = 1,
                    Name = "Car",
                    Price = 100000
                },
                new Products()
                {
                    Id = 2,
                    Name = "Dog",
                    Price = 300
                },
                new Products()
                {
                    Id = 3,
                    Name = "Horse",
                    Price = 200
                }
            );

        }
    }
}

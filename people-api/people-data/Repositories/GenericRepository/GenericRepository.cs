using Microsoft.EntityFrameworkCore;
using people_data.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace people_data.Repositories.GenericRepository
{
    public class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        protected PeopleAppDBContext context;
        internal DbSet<T> dbSet;
        public GenericRepository(PeopleAppDBContext context)
        {
            this.context = context;
            dbSet = context.Set<T>();
        }

        public async Task<T> Add(T entity)
        {
            await dbSet.AddAsync(entity);
            return entity;
        }

        public bool DeleteById(int id)
        {
            var model = dbSet.Find(id);

            if (model == null)
            {
                return false;
            }
            
            dbSet.Remove(model);
            return true;
        }

        public async Task<IEnumerable<T>> GetAll()
        {
            return await dbSet.ToListAsync();
        }

        public virtual async Task<T> GetById(int id)
        {
            return await dbSet.FindAsync(id);
        }

        public bool Update(T entity)
        {
            if (entity == null)
            {
                return false;
            }

            dbSet.Update(entity);

            return true;
        }

        public bool UpdateGroup(List<T> entities)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<T>> Where(Expression<Func<T, bool>> predicate)
        {
            throw new NotImplementedException();
        }
    }
}

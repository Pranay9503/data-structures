#include<stdio.h>
#include<stdlib.h>
typedef struct DLL
{
    int data;
    struct DLL *right,*left;
}node;
node* create(node *first)
{
    node *new,*prev;
    int x;
    printf("enter value of x\n");
    scanf("%d",&x);
    while(x!=-1)
    {
        new=(node*)malloc(sizeof(node));
        new->data=x;
        new->right=new->left=NULL;
        if(first==NULL)
        {
            first=new;
        }
        else
        {
            prev->right=new;
            new->left=prev;
        }
        prev=new;
        printf("enter value of x(enter -1 to stop)\n");
        scanf("%d",&x);
    }
    return first;
}
void display(node *first)
{
    node *temp;
    if(first==NULL)
        printf("\nno element in list to print\n");
    else
    {
        temp=first;
        printf("HEAD");
        while(temp!=NULL)
        {
            printf("<-|%d|->",temp->data);
            temp=temp->right;
        }
        printf("NULL\n");
    }
}
int count(node *first)
{
    node *temp=first;
    int c=0;
    if(first==NULL)
        return c;
    else
    {
        while(temp!=NULL)
        {
            c++;
            temp=temp->right;
        }
    }
    return c;
}
void search(node *first,int x)
{
    node *temp=first;
    int flag=0;
    if(first==NULL)
        printf("there is no element to search\n");
    else
    {
        while(temp!=NULL)
        {
            if(temp->data==x)
            {
                flag=1;
                printf("%d is found\n",x);
                break;
            }
            else
            {
                temp=temp->right;
            }
        }
        if(flag==0)
        {
            printf("%d is not found\n",x);
        }
    }
}
node* insert_at_begin(node *first,int x)
{
    node *new,*prev;
    node *temp=first;
    new=(node*)malloc(sizeof(node));
    new->right=new->left=NULL;
    new->data=x;
    if(first==NULL)
        first=new;
    else
    {
        new->right=first;
        first->left=new;
        first=new;
    }
    return first;
}
node* insert_at_end(node *first,int x)
{
    node *new,*temp=first;
    new=(node*)malloc(sizeof(node));
    new->data=x;
    new->right=new->left=NULL;
    if(first==NULL)
        first=new;
    else
    {
        while(temp->right!=NULL)
        {
            temp=temp->right;
        }
        temp->right=new;
        new->left=temp;
    }
    return first;
}
node* insert_at_pos(node *first,int x,int pos)
{
    int n,i;
    node *new,*temp;
    new=(node*)malloc(sizeof(node));
    new->data=x;
    new->left=new->right=NULL;
    n=count(first);
    if(pos>1&&pos<n)
    {
        temp=first;
        for(i=1;i<pos-1;i++)
            temp=temp->right;
        new->right=temp->right;
        temp->right=new;
        new->right->left=new;
    }
    return first;
}
node* delete(node *first,int x)
{
    node *temp;
    int flag=0;
    if(first==NULL)
        printf("no elements in the list to print");
    else if(first->data==x)
    {
        temp=first;
        first=first->right;
        if(first!=NULL)
        {
            first->left=NULL;
        }
        free(temp);
    }
    else
    {
        while(temp!=NULL)
        {
            if(temp->data==x)
            {
                flag=1;
                break;
            }
            else
                temp=temp->right;
        }
        if(flag==1)
        {
            if(temp->right==NULL)
            {
                temp->left->right=NULL;
                free(temp);
            }
            else
            {
                temp->left->right=temp->right;
                temp->right->left=temp->left;
                free(temp);
            }
        }
        else
            printf("element %d is not found to delete",x);
    }
    return first;
}
node* sort(node *first)
{  
    node *temp=NULL,*temp1=NULL;  
    int x;  
    if(first == NULL)
        printf("no elements in the list to sort");  
    else
    {  
        for(temp = first; temp->right != NULL; temp = temp->right)
        {  
            for(temp1 = temp->right; temp1 != NULL; temp1 = temp1->right)
            {  
                if(temp->data > temp1->data)
                {  
                    x = temp->data;  
                    temp->data = temp1->data;  
                    temp1->data = x;  
                }  
            }  
        }  
    }
    return first;
}
node* reverse(node *first)
{
    node *present=first,*prev=NULL,*save=NULL;
    while(present!=NULL)
    {
        save=present->right;
        present->right=prev;
        prev=present;
        present=save;
    }
    first=prev;
    return first;
}
int main()
{
     int ch,x,n,pos;
    node *head=NULL;
    head=create(head);
    display(head);
    while(1)
    {
        printf("1:create\n 2:display\n 3:count\n 4:search\n 5:insert_at_begin\n 6:insert_at_end\n 7:insert_at_pos\n 8:delete\n 9:sort\n 10:reverse\n 11:exit");
        printf("\nenter your choice\n");
        scanf("%d",&ch);
        switch(ch)
        {
            case 1: head=create(head);
                    break;
            case 2: display(head);
                    break;
            case 3: n=count(head);
                    printf("the no. of nodes in the list are %d\n",n);
                    break;
            case 4: printf("enter the element to be searched\n");
                    scanf("%d",&x);
                    search(head,x);
                    break;
            case 5: printf("enter the element to be inserted\n");
                    scanf("%d",&x);
                    head=insert_at_begin(head,x);
                    break;
            case 6: printf("enter the element to be inserted\n");
                    scanf("%d",&x);
                    head=insert_at_end(head,x);
                    break;
            case 7: printf("enter the element to be inserted\n");
                    scanf("%d",&x);
                    printf("enter the position where to be inserted\n");
                    scanf("%d",&pos);
                    head=insert_at_pos(head,x,pos);
                    break;
            case 8: printf("enter the value to be deleted\n");
                    scanf("%d",&x);
                    head=delete(head,x);
                    break;
            case 9: head=sort(head);
                    break;
            case 10:head=reverse(head);
                    break;
            case 11:exit(0);
            default:printf("invalid input");
        }
    }
    return 0;
}
